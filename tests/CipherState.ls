/**
 * @package   noise-c.wasm
 * @author    Nazar Mokrynskyi <nazar@mokrynskyi.com>
 * @copyright Copyright (c) 2017, Nazar Mokrynskyi
 * @license   MIT License, see license.txt
 */
randombytes	= require('crypto').randomBytes
lib			= require('..')
test		= require('tape')

lib.ready !->
	for cipher in ['NOISE_CIPHER_CHACHAPOLY', 'NOISE_CIPHER_AESGCM']
		test("CipherState (#cipher): Encryption/decryption without additional data", (t) !->
			t.plan(8)

			key			= randombytes(32)
			plaintext	= new Uint8Array(randombytes(10))

			cs1	= new lib.CipherState(lib.constants[cipher])
			t.equal(cs1.HasKey(), false, 'No key initially')

			cs1.InitializeKey(key)
			t.equal(cs1.HasKey(), true, 'Key was initialized')

			ciphertext	= cs1.EncryptWithAd(new Uint8Array, plaintext)
			t.equal(ciphertext.length, plaintext.length + 16, 'ciphertext length is plaintext length + MAC')
			t.notEqual(plaintext.toString(), ciphertext.slice(0, plaintext.length).toString(), 'Plaintext and ciphertext are different')

			ciphertext2	= cs1.EncryptWithAd(new Uint8Array, plaintext)
			t.notEqual(ciphertext.toString(), ciphertext2.toString(), "Subsequent encryption doesn't have the same result")
			cs1.free()

			t.throws (!->
				cs1.EncryptWithAd(new Uint8Array, plaintext)
			), "CipherState shouldn't be usable after `.free()` is called"

			cs2	= new lib.CipherState(lib.constants[cipher])
			cs2.InitializeKey(key)
			plaintext_decrypted	= cs2.DecryptWithAd(new Uint8Array, ciphertext)
			t.equal(plaintext.toString(), plaintext_decrypted.toString(), 'Plaintext decrypted correctly')

			t.throws (!->
				cs2.DecryptWithAd(new Uint8Array, ciphertext)
			), /Error/, 'Subsequent decryption fails'
			cs2.free()
		)

		test("CipherState (#cipher): Encryption/decryption with additional data", (t) !->
			t.plan(9)

			key			= randombytes(32)
			ad			= randombytes(256)
			plaintext	= new Uint8Array(randombytes(10))

			cs1	= new lib.CipherState(lib.constants[cipher])
			t.equal(cs1.HasKey(), false, 'No key initially')

			cs1.InitializeKey(key)
			t.equal(cs1.HasKey(), true, 'Key was initialized')

			ciphertext	= cs1.EncryptWithAd(ad, plaintext)
			t.equal(ciphertext.length, plaintext.length + 16, 'ciphertext length is plaintext length + MAC')
			t.notEqual(plaintext.toString(), ciphertext.slice(0, plaintext.length).toString(), 'Plaintext and ciphertext are different')

			ciphertext2	= cs1.EncryptWithAd(ad, plaintext)
			t.notEqual(ciphertext.toString(), ciphertext2.toString(), "Subsequent encryption doesn't have the same result")
			cs1.free()

			t.throws (!->
				cs1.EncryptWithAd(new Uint8Array, plaintext)
			), "CipherState shouldn't be usable after `.free()` is called"

			cs2	= new lib.CipherState(lib.constants[cipher])
			cs2.InitializeKey(key)
			plaintext_decrypted	= cs2.DecryptWithAd(ad, ciphertext)
			t.equal(plaintext.toString(), plaintext_decrypted.toString(), 'Plaintext decrypted correctly')

			t.throws (!->
				cs2.DecryptWithAd(ad, ciphertext)
			), /Error/, 'Subsequent decryption fails'
			cs2.free()

			cs3	= new lib.CipherState(lib.constants[cipher])
			cs3.InitializeKey(key)
			t.throws (!->
				cs2.DecryptWithAd(randombytes(256), ciphertext)
			), /Error/, 'Plaintext decryption with incorrect additional data fails'
			cs3.free()
		)
