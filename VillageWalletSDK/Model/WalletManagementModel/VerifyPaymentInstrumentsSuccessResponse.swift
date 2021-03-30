import UIKit

/**
 The JSON success response structure of the Verify Payment InstrumentsApi endpoint.
 */
public protocol VerifyPaymentInstrumentsSuccessResponse {
	/* Container reference in the transaction logs. This number uniquely identifies the whole/grouped transaction in the container. */
	var transactionReceipt: String { get }

	/* Not in use. A property that will be used in future for multi-instrument verification.*/
	var partialSuccess: Bool? { get }

	var fraudResponse: FraudResponse { get }

	var verifyResponses: [VerifyResponse] { get }
}

public protocol FraudResponse {
	/* The fraud check client id. Will be null if the fraud check was skipped. */
	var clientId: String { get }

	/* The fraud check reason code. Will be null if the fraud check was skipped. */
	var reasonCode: String { get }

	/* The fraud check decision. Will be null if the fraud check was skipped. */
	var decision: String { get }
}

public protocol VerifyResponse {
	/* The payment token. */
	var paymentToken: String { get }

	/* Container reference in the transaction logs. This number uniquely identifies the transaction in the container. */
	var verifyTransactionRef: String { get }

	/* The external service code (from eg. Webpay). This property is only included in the response if it is enabled in the consumers API configuration. */
	var externalServiceCode: String { get }

	/* The external service message (from eg. Webpay). This property is only included in the response if it is enabled in the consumers API configuration. */
	var externalServiceMessage: String { get }
}
