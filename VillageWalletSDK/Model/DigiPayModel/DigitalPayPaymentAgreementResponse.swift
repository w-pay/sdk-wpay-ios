import UIKit

/**
 The JSON response structure of the Create and Update Payment Agreement endpoints.
 */
public protocol DigitalPayPaymentAgreementResponse {
	/**
	 Container reference in the transaction logs.

	 This number uniquely identifies the transaction in the container.
	 */
	var transactionReceipt: String { get }

	/**
	 The payment token of the payment agreement.

	 The payment token is a unique identifier for the payment agreement.
	 */
	var paymentToken: String? { get }

	/** Detail of the payment agreement that has been created or updated */
	var paymentAgreement: DigitalPayResponsePaymentAgreement { get }

	/** Fraud response */
	var fraudResponse: DigitalPayFraudResponse? { get }

	/** Extended transaction data object */
	var extendedTransactionData: [DigitalPayExtendedTransactionData]? { get }

	/**
	 The external service code (from eg. Webpay).

	 This property is only included in the response if it is enabled in the consumers API configuration.
	 */
	var externalServiceCode: String? { get }

	/**
	 The external service message (from eg. Webpay).

	 This property is only included in the response if it is enabled in the consumers API configuration.
	 */
	var externalServiceMessage: String? { get }
}

public protocol DigitalPayResponsePaymentAgreement {
	/** The payment agreement type. */
	var type: PaymentAgreementType { get }

	/** The payment agreement payment instrument id that will be used for the charges. */
	var paymentInstrumentId: String { get }

	/** The type of the payment instrument used in the payment agreement. */
	var paymentInstrumentType: String { get }

	/** The credit card scheme */
	var scheme: String { get }

	/** The suffix (last 4 digits) of the credit card number. */
	var cardSuffix: String { get }

	/** The month of the expiry date of the credit card. */
	var expiryMonth: String { get }

	/** The year of the expiry date of the credit card. */
	var expiryYear: String { get }

	/** The payment agreement start date and time. The timestamp format is ISO8601. */
	var startDate: String { get }

	/** The payment agreement end date and time. The timestamp format is ISO8601. */
	var endDate: String { get }

	/** The payment agreement charge frequency. */
	var chargeFrequency: PaymentAgreementChargeFrequency { get }

	/** The amount that will be charged at the frequency specified in the payment agreement. */
	var chargeAmount: Decimal { get }
}
