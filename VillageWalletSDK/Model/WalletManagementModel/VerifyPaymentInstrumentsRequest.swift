import UIKit

/**
 The JSON request structure of the Verify Payment InstrumentsApi endpoint.
 */
public protocol VerifyPaymentInstrumentsRequest {
	/* A merchant application specific reference number. This number should uniquely identify the transaction in the merchant’s system.*/
	var clientReference: String { get }

	/* The step-up token is used to track additional credit card information (eg. CVV and expiry) attached to the payment instrument. It's only valid for a predefined time and if an expired step-up token is used during payment, the payment for that instrument will fail and the user will have to get a new step-up token before retrying the payment. A step-up token is returned in the response of a credit card iframe. This property is currently only required for credit card instruments and only if specific credit card information (eg. CVV and expiry) is required during payment. */
	var paymentInstruments: [VerifyPaymentInstrumentsRequestInstrument] { get }

	/* Set to null to skip the fraud check. */
	var fraudPayload: FraudPayload? { get }
}

public protocol FraudPayload {
	/* The fraud check provider. */
	var provider: String { get }

	/* The fraud check version. */
	var version: String { get }

	/* The fraud check message format. */
	var format: MessageFormat { get }

	/* The fraud check message format. */
	var responseFormat: MessageFormat { get }

	/* The fraud check message. */
	var message: String { get }
}

public protocol VerifyPaymentInstrumentsRequestInstrument {
	/* The payment token. */
	var paymentToken: String { get }

	/**
	 * The step-up token is used to track additional credit card information (eg. CVV and expiry) attached to the payment instrument.
	 * It's only valid for a predefined time and if an expired step-up token is used during payment,
	 * the payment for that instrument will fail and the user will have to get a new step-up token before retrying the payment.
	 * A step-up token is returned in the response of a credit card iframe.
	 * This property is currently only required for credit card instruments and only if specific credit card information (eg. CVV and expiry) is required during payment.
	 */
	var stepUpToken: String { get }
}

public enum MessageFormat: String {
	case ZIP_BASE_64_ENCODED, XML
}