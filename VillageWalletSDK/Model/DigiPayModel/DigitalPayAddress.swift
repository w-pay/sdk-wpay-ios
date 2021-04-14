import UIKit

/**
 A customer's address
 */
public protocol DigitalPayAddress {
	/** The recipient's first name. */
	var firstName: String { get }

	/** The recipient's last name. */
	var lastName: String { get }

	/** The recipient’s email address. */
	var email: String? { get }

	/** The recipient's company name. */
	var company: String? { get }

	/** The recipient's extended address line. */
	var extendedAddress: String? { get }

	/** The recipient's street address line. */
	var streetAddress: String { get }

	/** The recipient's suburb. */
	var suburb: String { get }

	/** The recipient's abbreviated state or territory. */
	var stateOrTerritory: String { get }

	/** The recipient's postal code */
	var postalCode: String { get }

	/** The recipient's Alpha-2 (2-character) ISO-3166-1 country code. */
	var countryCode: String { get }
}
