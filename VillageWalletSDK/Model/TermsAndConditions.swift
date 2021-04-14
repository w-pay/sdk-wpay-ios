import UIKit

/**
 List of terms and conditions acceptances
 */
public protocol TermsAndConditionsAcceptances {
	/** An array of Ts and Cs the customer has accepted.. */
	var termsAndConditionsAcceptances: [TermsAndConditionsAcceptance] { get }
}

/**
 The Terms and Conditions the customer has accepted.
 */
public protocol TermsAndConditionsAcceptance {
	/** The type of the Ts and Cs. */
	var type: String { get }

	/** The version of the Ts and Cs. */
	var version: String { get }

	/** The timestamp when the shopper/customer agreed to the Everyday Pay Ts and Cs.  The timestamp format is milliseconds since epoch. */
	var timestamp: Decimal { get }
}

public protocol AcceptTermsAndConditionsRequest {
	/** The type of Ts and Cs that the shopper/customer has agreed to. */
	var type: String { get }

	/** The current version of the Ts and Cs that the shopper/customer has agreed to. */
	var version: String { get }
}
