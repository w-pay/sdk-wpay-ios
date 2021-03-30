import UIKit

/**
 The JSON request structure of the Update Payment Agreement endpoint.
 */
public protocol DigitalPayUpdatePaymentAgreementRequest {
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
	var billingAddress: DigitalPayAddress? { get }

	/** Detail of the payment agreement to be created */
	var paymentAgreement: DigitalPayRequestPaymentAgreement? { get }

	/** Digital pay fraud payload */
	var fraudPayload: DigitalPayFraudResponse? { get }
}
