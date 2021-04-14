import UIKit

/**
 The JSON request structure of the Create Payment Agreement endpoint.
 */
public protocol DigitalPayCreatePaymentAgreementRequest {
	/**
	 A merchant application specific reference number.

	 This number should uniquely identify the transaction in the merchant’s system.
	 */
	var clientReference: String { get }

	/**
	 A merchant application specific reference number.

	 This number should uniquely identify the customer in the merchant’s system.
	 */
	var customerRef: String? { get }

	/**
	 The merchant order number of the transaction.

	 This property is only required if the 'immediateCharge' property is true.
	 */
	var orderNumber: String? { get }

	/** Customer billing address for this payment agreement */
	var billingAddress: DigitalPayAddress { get }

	/** Detail of the payment agreement to be created */
	var paymentAgreement: DigitalPayRequestPaymentAgreement { get }

	/** Digital pay fraud payload */
	var fraudPayload: DigitalPayFraudPayload? { get }
}

public protocol DigitalPayRequestPaymentAgreement {
	/** The payment agreement type. */
	var type: PaymentAgreementType { get }

	/** The payment agreement payment instrument id that will be used for the charges. */
	var paymentInstrumentId: String { get }

	/** The payment agreement charge frequency. */
	var chargeFrequency: PaymentAgreementChargeFrequency { get }

	/** The amount that will be charged at the frequency specified in the payment agreement. */
	var chargeAmount: Decimal { get }

	/** The payment agreement start date and time. The timestamp format is ISO8601. */
	var startDate: String? { get }

	/** The payment agreement end date and time. The timestamp format is ISO8601. */
	var endDate: String? { get }

	/**
	 A flag to indicate if a charge transaction must be performed at the time of payment agreement creation.

	 This in convenient in the cases where a customer wants to process a first charge transaction immediately at payment agreement creation.
	 */
	var immediateCharge: Bool { get }

	/**
	 The step-up token is used to track additional credit card information (eg. CVV and expiry) attached to the payment instrument.

	 It's only valid for a predefined time and if an expired step-up token is used during validation, the validation of that instrument will fail and the user will have to get a new step-up token before retrying the API call. A step-up token is returned in the response of a credit card iframe. This property is only required for credit card instruments and only if specific credit card information (eg. CVV and expiry) is required during the API call.
	 */
	var stepUpToken: String { get }
}
