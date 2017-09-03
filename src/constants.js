// Generated by LiveScript 1.5.0
/**
 * @package   noise-c.wasm
 * @author    Nazar Mokrynskyi <nazar@mokrynskyi.com>
 * @copyright Copyright (c) 2017, Nazar Mokrynskyi
 * @license   MIT License, see license.txt
 */
(function(){
  /**
   * Obtained using `vendor/include/noise/protocol/constants.h` converted to JavaScript and post-processed with Prepack to eliminate runtime computations
   *
   * There are many constants exposed by the library, but only subset of them is used in production, so the rest are still here, uncomment when/if needed
   * for debugging or other purposes
   */
  module.exports = {
    NOISE_CIPHER_NONE: 0,
    NOISE_CIPHER_CHACHAPOLY: 17153,
    NOISE_CIPHER_AESGCM: 17154,
    NOISE_PATTERN_XX_FALLBACK: 20496,
    NOISE_PATTERN_XX_FALLBACK_HFS: 20540,
    NOISE_ROLE_INITIATOR: 20993,
    NOISE_ROLE_RESPONDER: 20994,
    NOISE_ACTION_NONE: 0,
    NOISE_ACTION_WRITE_MESSAGE: 16641,
    NOISE_ACTION_READ_MESSAGE: 16642,
    NOISE_ACTION_FAILED: 16643,
    NOISE_ACTION_SPLIT: 16644,
    NOISE_ACTION_COMPLETE: 16645,
    NOISE_ERROR_NONE: 0,
    NOISE_ERROR_NO_MEMORY: 17665,
    NOISE_ERROR_UNKNOWN_ID: 17666,
    NOISE_ERROR_UNKNOWN_NAME: 17667,
    NOISE_ERROR_MAC_FAILURE: 17668,
    NOISE_ERROR_NOT_APPLICABLE: 17669,
    NOISE_ERROR_SYSTEM: 17670,
    NOISE_ERROR_REMOTE_KEY_REQUIRED: 17671,
    NOISE_ERROR_LOCAL_KEY_REQUIRED: 17672,
    NOISE_ERROR_PSK_REQUIRED: 17673,
    NOISE_ERROR_INVALID_LENGTH: 17674,
    NOISE_ERROR_INVALID_PARAM: 17675,
    NOISE_ERROR_INVALID_STATE: 17676,
    NOISE_ERROR_INVALID_NONCE: 17677,
    NOISE_ERROR_INVALID_PRIVATE_KEY: 17678,
    NOISE_ERROR_INVALID_PUBLIC_KEY: 17679,
    NOISE_ERROR_INVALID_FORMAT: 17680,
    NOISE_ERROR_INVALID_SIGNATURE: 17681,
    NOISE_MAX_PAYLOAD_LEN: 65535
  };
}).call(this);
