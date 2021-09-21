import UIKit

/**
 The JSON success response structure of the Payments endpoint.
 */
public protocol DigitalPayPaymentResponse {
	/**
	 Container reference in the transaction logs.
	 
	 This number uniquely identifies the whole/grouped transaction in the container.
	 */
	var transactionReceipt: String { get }

	/**
	 A flag to indicate if a split payment was only partially successful,
	 
	 ie. at least 1 of the payment instruments had a successful payment result.
	 */
	var partialSuccess: Bool? { get }

	/** DigitalPay fraud response */
	var fraudResponse: DigitalPayFraudResponse { get }

	/** DigitalPay payment credit card payments */
	var creditCards: [DigitalPayCreditCard] { get }

	/** DigitalPay payment gift card payments */
	var giftCards: [DigitalPayGiftCard] { get }

	/** DigitalPay PayPal card payments */
	var payPal: [DigitalPayPayPal] { get }

	/**
	 Android Pay has been replaced by Google Pay.
	 
	 This property has been retained for backward compatibility and will always be an empty array.
	 */
	var androidPay: [Any] { get }

	/** DigitalPay payment Google Pay payments */
	var googlePay: [DigitalPayGooglePay] { get }

	/** DigitalPay payment Apple Pay payments */
	var applePay: [DigitalPayApplePay] { get }

	/** DigitalPay payment unknown payments */
	var unknown: [DigitalPayPaymentInstrument] { get }
}

public protocol DigitalPayFraudResponse {
	/** The fraud check client id. Will be null if the fraud check was skipped. */
	var clientId: String { get }

	/** The fraud check reason code. Will be null if the fraud check was skipped. */
	var reasonCode: String { get }

	/** The fraud check decision. Will be null if the fraud check was skipped. */
	var decision: String { get }
}

public protocol DigitalPayPaymentInstrument {
	/** The credit card payment instrument id. */
	var paymentInstrumentId: String { get }

	/** The credit card payment token. The payment token is a unique identifier for the payment instrument. */
	var paymentToken: String { get }

	/** Container reference in the transaction logs. This number uniquely identifies the credit card transaction in the container. */
	var paymentTransactionRef: String { get }

	/** The error code. Only present if an error occurred during payment. */
	var errorCode: String? { get }

	/** The error message. Only present if an error occurred during payment. */
	var errorMessage: String? { get }

	/** The error detail. Only present if an error occurred during payment. */
	var errorDetail: String? { get }
}

public protocol DigitalPayCreditCard: DigitalPayPaymentInstrument {
	/** Only present if an error occurred during payment. */
	var stepUp: CreditCardStepUp? { get }

	/** This object is only included in the response if it is enabled in the consumers API configuration. */
	var receiptData: DigitalPayReceiptData? { get }

	/** This array is only included in the response if it is enabled in the consumers API configuration. */
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

	/**
	 Special handling instructions that have to be executed after a payment.

	 Only present if no error occurred during payment.
	 */
	var handlingInstructions: DigitalPayHandlingInstructions? { get }

	/** This object is only present if the payments response contains 3DS data from Digital Pay. */
	var threeDS: DigitalPayThreeDSResponse? { get }
}

public protocol DigitalPayHandlingInstructions {
	/** The handling instruction code. */
	var instructionCode: DigitalPayInstructionCode { get }

	/** The handling instruction message. */
	var instructionMessage: String { get }
}

public protocol DigitalPayGiftCard: DigitalPayPaymentInstrument {
	/** Only present if an error occurred during payment. */
	var stepUp: CreditCardStepUp? { get }

	/** This object is only included in the response if it is enabled in the consumers API configuration. */
	var receiptData: DigitalPayReceiptData? { get }

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

public protocol DigitalPayPayPal: DigitalPayPaymentInstrument {
	/** This object is only included in the response if it is enabled in the consumers API configuration. */
	var receiptData: DigitalPayReceiptData? { get }

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

public protocol DigitalPayGooglePay: DigitalPayPaymentInstrument {
	/** Only present if an error occurred during payment. */
	var stepUp: CreditCardStepUp? { get }

	/** This array is only included in the response if it is enabled in the consumers API configuration. */
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

public protocol DigitalPayApplePay: DigitalPayPaymentInstrument {
	/** Only present if an error occurred during payment. */
	var stepUp: CreditCardStepUp? { get }
}

public protocol DigitalPayReceiptData {
	/** The suffix (last 4 digits) of the credit card number used in the WebPay transaction. */
	var cardSuffix: String { get }

	/** The credit card scheme. */
	var scheme: String { get }

	/** The month of the expiry date of the credit card. */
	var expiryMonth: String { get }

	/** The year of the expiry date of the credit card. */
	var expiryYear: String { get }
}

public protocol DigitalPayExtendedTransactionData {
	/**
	 The name of the extended transaction data field.

	 The 'token' field is only included in the response if it is enabled in the consumers API configuration.
	 */
	var field: DigitalPayExtendedTransactionDataFieldName { get }

	/** The value of the extended transaction data field. */
	var value: String { get }
}

public protocol DigitalPayThreeDSResponse {
	/** Received in response to a Visa authenticated Purchase and PreAuth. Only present for Visa. */
	var car: String? { get }

	/** The Directory Server (DS) authentication identification code. A universally unique transaction identifier assigned by the DS to identify a single transaction. The format of the value is defined in IETF RFC 4122. It may utilise any of the specified versions if the output meets specific requirements. */
	var dsTransID: String { get }

	/** The SLI from the the schemes. */
	var sli: String { get }
}


public enum DigitalPayExtendedTransactionDataFieldName: String {
	case BIN, STAN, RRN, TOKEN, MID, TERMINA_ID
}

public enum DigitalPayInstructionCode: String {
	case INSTRUCTION_100, INSTRUCTION_110, INSTRUCTION_120
}
