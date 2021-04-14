import UIKit

/**
 The JSON request structure of the Tokenize Android Pay endpoint.
 */
public protocol TokenizeAndroidPayRequest {
	/** The "encryptedMessage" value from the Android Pay wallet.*/
	var encryptedMessage: String { get }

	/** The "ephemeralPublicKey" value from the Android Pay wallet. */
	var ephemeralPublicKey: String { get }

	/** The "tag" value from the Android Pay wallet. */
	var tag: String { get }

	/** The "publicKeyHash" value from the merchant profile response. */
	var publicKeyHash: String { get }

	/** The type/schema value from the Android Pay wallet. */
	var instrumentType: String { get }

	/** A flag to indicate if this payment instrument has to be set as the primary instrument. */
	var primary: Bool? { get }

	/** The display text returned by the Android Pay wallet. */
	var comment: String { get }
}
