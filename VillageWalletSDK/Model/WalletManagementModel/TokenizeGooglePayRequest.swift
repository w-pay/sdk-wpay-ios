import UIKit

/**
 The JSON request structure of the Tokenize Google Pay endpoint.
 */
public protocol TokenizeGooglePayRequest {
	/** The type/schema value from the Google Pay wallet. */
	var instrumentType: String { get }

	/** The display text returned by the Google Pay wallet. */
	var comment: String { get }

	/** The "tokenData" payload from the Google Pay wallet. */
	var tokenData: String { get }
}
