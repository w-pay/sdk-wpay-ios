import UIKit

/**
 Available preference settings for a customer
 */
public protocol CustomerPreferences {
	/** Payment preferences for a customer */
	var payments: PaymentPreferences? { get }

	/** Map of general preferences. */
	var general: Preferences? { get }
}

/**
 Payment preferences for a customer
 */
public protocol PaymentPreferences {
	/**
	 The primary instrument that will be used by default for a payment if a specific instrument is not specified.

	 The primary instrument will be used for the balance of the payment after any specified secondary instruments are used first.
	 */
	var primaryInstrumentId: String { get }

	/**
	 Rules for the creation of a default set of secondary instruments to be used for a payment if a specific set is not specified.

	 Secondary instruments are used in order until the full amount of the payment has been paid.
	 */
	var secondaryInstruments: SecondaryInstrumentPreferences? { get }
}

public protocol SecondaryInstrumentPreferences {
	/**
	 Flag indicating whether secondary instruments are enabled or disabled.

	 If not present defaults to enabled. Used to specifically disable secondary instruments without losing customer configure preferences.
	 */
	var enableSecondaryInstruments: Bool? { get }

	/** The order that the secondary instruments will be used for a specific payment. */
	var order: SecondaryInstrumentOrder? { get }

	/**
	 Array of instruments to exclude from the secondary instruments set.

	 Indicates that the set of secondary instruments should include all valid instruments excluding those in this list.
	 */
	var exclude: [String]? { get }

	/**
	 Array of instruments to specifically include in the secondary instruments set.

	 Indicates that the set of secondary instruments should start as empty and only include all valid instruments excluding those in this list.
	 */
	var include: [String]? { get }
}

public enum SecondaryInstrumentOrder: String {
	case BALANCE_ASC, BALANCE_DESC, EXPIRY_ASC, EXPIRY_DESC, FIFO, LIFO, INCLUDE_ORDER
}

/**
 Map of general preferences.
 */
public typealias Preferences = [String: [String: String]]
