import UIKit

/**
 Common properties of the `PaymentAgreement` request
 */
public protocol CommonPaymentAgreementRequest {
	/** A merchant application specific reference number for the transaction. */
	var clientReference: String { get }

	/** A merchant application specific reference number for the customer. */
	var customerRef: String? { get }

	/** Merchant order number of the transaction. */
	var orderNumber: String? { get }

	/** Description of the payment agreement. Used to distinguish payment agreements from one another. */
	var description: String? { get }
}

/**
 Request containing the details of the `PaymentAgreement` to create
 */
public protocol CreatePaymentAgreementRequest: CommonPaymentAgreementRequest {
	/** Billing address for the customer. */
	var billingAddress: PaymentAgreementBillingAddress { get }

	/** Details of the payment agreement */
	var paymentAgreement: PaymentAgreement { get }
}

/**
 Request containing the details of the `PaymentAgreement` to update
 */
public protocol UpdatePaymentAgreementRequest: CommonPaymentAgreementRequest {
	/** Billing address for the customer. */
	var billingAddress: PaymentAgreementBillingAddress? { get }

	/** Details of the payment agreement */
	var paymentAgreement: PaymentAgreement? { get }
}

/**
 The customer's billing address
 */
public protocol PaymentAgreementBillingAddress {
	/** The customer's first name. */
	var firstName: String { get }

	/** The customer's last name. */
	var lastName: String { get }

	/** The customer’s email address. */
	var email: String { get }

	/** The customer's company name. */
	var company: String? { get }

	/** The customer's extended address line. */
	var extendedAddress: String? { get }

	/** The customer's street address line. */
	var streetAddress: String { get }

	/** The customer's suburb. */
	var suburb: String { get }

	/** The customer's abbreviated state or territory. */
	var stateOrTerritory: String { get }

	/** The customer's postal code. */
	var postalCode: String { get }

	/** The customer's Alpha-2 (2-character) ISO-3166-1 country code. */
	var countryCode: String { get }
}
