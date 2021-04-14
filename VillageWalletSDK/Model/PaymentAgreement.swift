import UIKit

/**
 Properties of a Payment Agreement
 */
public protocol PaymentAgreement {
	/** The payment token of the payment agreement. The payment token is a unique identifier for the payment agreement. */
	var paymentToken: String { get }

	/** The status of the payment agreement in the container. */
	var status: PaymentInstrumentStatus { get }

	/** The timestamp the payment agreement was last updated in the container. The timestamp format is ISO8601. */
	var lastUpdated: Date? { get }

	/** The timestamp the payment agreement was last used in the container. The timestamp format is ISO8601. Will be null if never used. */
	var lastUsed: Date? { get }

	/** The timestamp for when the payment instrument was added. The timestamp format is ISO8601. */
	var createdOn: Date? { get }

	/** A flag to indicate if this payment instrument is the primary instrument in the container. Not used for payment agreements. */
	var primary: Bool? { get }

	/** A flag to indicate if the merchant profile in the container allows the use of this payment agreement. */
	var allowed: Bool? { get }

	/** The payment agreement type. */
	var type: PaymentAgreementType { get }

	/** The payment agreement payment instrument id that will be used for the charges. */
	var paymentInstrumentId: String { get }

	/** The credit card scheme. */
	var scheme: String? { get }

	/** The suffix (last 4 digits) of the credit card number. */
	var cardSuffix: String? { get }

	/** The month of the expiry date of the credit card. */
	var expiryMonth: String? { get }

	/** The year of the expiry date of the credit card. */
	var expiryYear: String? { get }

	/** The payment agreement start date and time. The timestamp format is ISO8601. */
	var startDate: Date? { get }

	/** The payment agreement end date and time. The timestamp format is ISO8601. */
	var endDate: Date? { get }

	/** The payment agreement charge frequency. */
	var chargeFrequency: PaymentAgreementChargeFrequency { get }

	/** The amount that will be charged at the frequency specified in the payment agreement. */
	var chargeAmount: Decimal { get }

	/** The current charge cycle number. */
	var chargeCycle: Decimal { get }

	/** A flag to indicate if the payment agreement is expired. */
	var expired: Bool? { get }

	/** The URL of the endpoint to use to update the payment agreement. */
	var updateURL: String { get }

	var stepUp: PaymentAgreementStepUp? { get }

	/** A description of the payment agreement */
	var description: String? { get }
}

public protocol PaymentAgreementStepUp {
	/* The type of the step up action. For credit cards this will be CAPTURE_CVV which identifies that the consumer must capture the CVV prior to payment. */
	var type: String { get }

	/* A flag to indicate if this step up (action) is mandatory. */
	var mandatory: Bool? { get }

	/* The URL of an iframe. This iframe is used to capture a credit card expiry and CVV or CVV only. The URL will automatically switch between expiry and CVV or CVV only endpoints based on the container requirement. */
	var url: String { get }
}

/**
 List of payments agreements.
 */
public protocol PaymentAgreements {
	/** The resulting list of payment agreements. */
	var paymentAgreements: [PaymentAgreement] { get }
}

/**
 Frequency with which the payment agreement is charged
 */
public enum PaymentAgreementChargeFrequency: String {
	case WEEKLY, FORTNIGHTLY, MONTHLY
}

/**
 Type of payment agreement
 */
public enum PaymentAgreementType: String {
	case RECURRING, ADHOC, INSTALLMENT
}
