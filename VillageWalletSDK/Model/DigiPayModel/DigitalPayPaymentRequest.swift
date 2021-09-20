import UIKit

/**
 The JSON request structure of the Payments endpoint
 */
public protocol DigitalPayPaymentRequest {
	/**
	 Transaction type containers to use for all instruments.

	 This object is only required if the payments request contains apple pay instruments.
	 */
	var transactionType: PaymentTransactionType { get }

	/** A merchant application specific reference number. This number should uniquely identify the transaction in the merchant’s system. */
	var clientReference: String { get }

	/** The merchant order number of the transaction. */
	var orderNumber: String { get }

	/** This object is only required if the payments request contains paypal instruments. */
	var shippingAddress: DigitalPayAddress { get }

	/** List of payments */
	var payments: [DigitalPayPayment] { get }

	/** Extended merchant data */
	var extendedMerchantData: [ExtendedMerchantData]? { get }

	/** Set to null to skip the cybersource fraud check. */
	var fraudPayload: DigitalPayFraudPayload? { get }

	/** This object is only required if the payments request is for an in-store payment transaction. */
	var storeData: DigitalPayStoreData? { get }
}

public protocol DigitalPayPayment {
	/**
	 The payment instrument id from the card capture iframe response or the list payment instruments response.

	 This property can be omitted if the payment token property is present.
	 */
	var paymentInstrumentId: String { get }

	/**
	 The payment token from the card capture iframe response or the list payment instruments response.

	 This property can be omitted if the payment instrument id property is present.
	 */
	var paymentToken: String { get }

	/** The amount you want to pay with the payment instrument. */
	var amount: Decimal { get }

	/**
	 The step-up token is used to track additional credit card information (eg. CVV and expiry) attached to the payment instrument.

	 It's only valid for a predefined time and if an expired step-up token is used during payment, the payment for that instrument will fail and the user will have to get a new step-up token before retrying the payment. A step-up token is returned in the response of a credit card iframe.

	 This property is currently only required for credit card instruments and only if specific credit card information (eg. CVV and expiry) is required during payment.
	 */
	var stepUpToken: String? { get }

	/**
	 The passcode is used to send additional information (eg. gift card PIN) for the payment instrument.

	 This property is currently only required for gift card instruments and only if the gift card PIN is required during payment.

	 This property should NOT be used with credit card instruments (see stepUpToken).
	 */
	var passcode: String? { get }

	/** This object is used to pass additional control data to Digital Pay */
	var controlData: DigitalPayControlData? { get }

	/** This object is only required if the payments request requires 3DS challenge response data to be sent to Digital Pay. */
	var threeDS: DigitalPayThreeDS? { get }
}

public protocol DigitalPayStoreData {
	/** The payment transaction merchant group id. The group id is defined as a logical grouping of merchants or stores. A default configured group id is set in Apigee if absent in the payload. */
	var groupId: String? { get }

	/** The in-store payment transaction terminal id. This is a 8 character alphanumeric string. If present in the payload the 'storeId' has to be omitted. */
	var terminalId: String? { get }

	/** The in-store payment transaction store id. */
	var storeId: String { get }

	/** The in-store payment transaction lane id. */
	var laneId: String? { get }

	/** The System Trace Audit Number (STAN) used to identify the transaction. This is a 6 digit numeric string. */
	var stan: String { get }

	/** The in-store payment transaction store id. This is a 12 digit \"0\" [zero] padded numeric string. */
	var rrn: String { get }

	/** The in-store payment transaction timestamp. The timestamp format is milliseconds since epoch. */
	var transactionTimestamp: Decimal { get }
}

public protocol ExtendedMerchantData {
	/** The name of the extended merchant data field. */
	var field: String { get }

	/** The value of the extended merchant data field. */
	var value: String { get }
}

public enum DigitalPayControlDataTokenType: String {
	case SCHEME_TOKEN, SCDR, PAN
}

public protocol DigitalPayControlData {
	/** The Digital Pay token type to use for a scheme card instrument during 3DS processing for merchants that have 3DS enabled. Defaults to 'PAN' if absent. **/
	var tokenType: DigitalPayControlDataTokenType? { get }
}

public enum DigitalPayThreeDSAresStatus: String {
	case AUTHENTICATED = "Y"
	case FAILED_OR_CANCELLED_AUTHENTICATION = "N"
	case CARD_CHALLENGED = "C"
	case AUTHENTICATION_REJECTED = "R"
	case PROOF_OF_AUTHENTICATION_GENERATED = "A"
	case AUTHENTICATION_NOT_COMPLETE = "U"
}

public enum DigitalPayThreeDSVeresEnrolled: String {
	case ENROLLED_MUST_AUTHENTICATE = "Y"
	case NOT_ENROLLED = "N"
	case UNABLE_TO_AUTHENTICATE = "U"
	case AUTHENTICATION_BYPASSED = "B"
}

public enum DigitalPayThreeDSTransStatus: String {
	case AUTHENTICATION_SUCCESSFUL = "Y"
	case NOT_AUTHENTICATED = "N"
	case AUTHENTICATION_NOT_PERFORMED = "U"
	case ATTEMPTS_PROCESSING_PERFORMED = "A"
	case ADDITIONAL_AUTHENTICATION_REQUIRED = "C"
	case DECOUPLED_AUTHENTICATION_PERFORMED = "D"
	case AUTHENTICATION_REJECTED = "R"
	case INFORMATIONAL_ONLY = "I"
}

public protocol DigitalPayThreeDS {
	/** The Protocol Version Number of the specification utilised by the system creating this message. */
	var messageVersion: String { get }

	/** The transaction identifier. Required for Mastercard and Amex. Not applicable for Visa. */
	var xid: String { get }

	/** The payment system-specific value provided by the ACS or the Directory Server (DS) using an algorithm defined by Payment System. */
	var authenticationValue: String { get }

	/** The Directory Server (DS) authentication identification code. A universally unique transaction identifier assigned by the DS to identify a single transaction. The format of the value is defined in IETF RFC 4122. It may utilise any of the specified versions if the output meets specific requirements. */
	var dsTransID: String { get }

	/** The electronic commerce indicator. Required for calculating the SLI. A Payment System-specific value provided by the ACS or DS to indicate the results of the attempt to authenticate the Cardholder. */
	var eci: String { get }

	/** The payer authentication response status. Required for Visa.
	  Y: Customer was successfully authenticated
	  N: Customer failed or canceled authentication
	  C: Card challenged
	  R: Authentication rejected
	  A: Proof of authentication attempt was generated
	  U: Authentication not completed regardless of the reason
	 */
	var aresStatus: DigitalPayThreeDSAresStatus { get }

	/** The verification response enrollment status. Required for Visa.
	  Y: Card enrolled, must authenticate
	  N: Card not enrolled, proceed with authorization
	  U: Unable to authenticate regardless of the reason
	  B: Indicates that authentication was bypassed
	 */
	var veresEnrolled: DigitalPayThreeDSAresStatus { get }

	/** Indicates whether a transaction qualifies as an authenticated transaction or account verification.
	  Y: Authentication Successful
	  N: Not Authenticated
	  U: Authentication could not be performed
	  A: Attempts Processing Performed Not authenticated
	  C: Challenge Required. Additional authentication is required
	  D: Challenge Required Decoupled Authentication performed
	  R: Authentication Rejected. Issuer is rejecting
	  I: Informational Only
	 */
	var transStatus: DigitalPayThreeDSTransStatus { get }

	/** The SLI from the merchant */
	var sli: String? { get }
}