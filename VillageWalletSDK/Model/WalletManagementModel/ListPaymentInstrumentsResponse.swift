import UIKit

/**
 The JSON response structure of the List Payment InstrumentsApi endpoint.
 */
public protocol ListPaymentInstrumentsResponse {
	var creditCards: [CreditCardDetails] { get }
	var giftCards: [GiftCardDetails] { get }
	var payPal: [PayPalDetails] { get }
	var paymentAgreements: [PaymentAgreementDetails] { get }

	/* Android Pay has been replaced by Google Pay. This property has been retained for backward compatibility and will always be null. */
	var androidPay: String? { get }
	var googlePay: GooglePayDetails { get }
	var applePay: ApplePayDetails { get }
}

public protocol CreditCardDetails {
	/* The credit card payment instrument id. */
	var paymentInstrumentId: String { get }

	/* The credit card payment token. The payment token is a unique identifier for the payment instrument. */
	var paymentToken: String { get }

	/* The status of the payment instrument in the container. */
	var status: PaymentInstrumentStatus { get }

	/* The timestamp the payment instrument was last updated in the container. The timestamp format is ISO8601. */
	var lastUpdated: String { get }

	/* The timestamp the payment instrument was last used in the container. The timestamp format is ISO8601. Will be null if never used. */
	var lastUsed: String { get }

	/* A flag to indicate if this payment instrument is the primary instrument in the container. */
	var primary: Bool? { get }

	/* A flag to indicate if the merchant profile in the container allows the use of this payment instrument. */
	var allowed: Bool? { get }

	/* The year of the expiry date of the credit card. */
	var expiryYear: String { get }

	/* The month of the expiry date of the credit card. */
	var expiryMonth: String { get }

	/* The credit card scheme. */
	var scheme: String { get }

	/* The suffix (last 4 digits) of the credit card number. */
	var cardSuffix: String { get }

	/* A flag to indicate if the CVV of the credit card has been validated. */
	var cvvValidated: Bool? { get }

	/* The nickname of the credit card instrument in the container. */
	var cardName: String { get }

	/* A flag to indicate if the credit card is expired. */
	var expired: Bool? { get }

	/* A flag to indicate if payments with this credit card requires a CVV check. */
	var requiresCVV: Bool? { get }

	/* The URL of an iframe. This iframe is used to capture a credit card expiry and CVV. */
	var updateURL: String { get }

	var stepUp: StepUp { get }
}

public protocol GiftCardDetails {
	/* The gift card payment instrument id. */
	var paymentInstrumentId: String { get }

	/* The gift card payment token. The payment token is a unique identifier for the payment instrument. */
	var paymentToken: String { get }

	/* The status of the payment instrument in the container. */
	var status: PaymentInstrumentStatus { get }

	/* The timestamp the payment instrument was last updated in the container. The timestamp format is ISO8601. */
	var lastUpdated: String { get }

	/* The timestamp the payment instrument was last used in the container. The timestamp format is ISO8601. Will be null if never used. */
	var lastUsed: String { get }

	/* A flag to indicate if this payment instrument is the primary instrument in the container. */
	var primary: Bool? { get }

	/* A flag to indicate if the merchant profile in the container allows the use of this payment instrument. */
	var allowed: Bool? { get }

	/* The gift card program name. */
	var programName: String { get }

	/* The suffix (last 4 digits) of the gift card number. */
	var cardSuffix: String { get }
}

public protocol PayPalDetails {
	/* The paypal payment instrument id. */
	var paymentInstrumentId: String { get }

	/* The paypal payment token. The payment token is a unique identifier for the payment instrument. */
	var paymentToken: String { get }

	/* The status of the payment instrument in the container. */
	var status: PaymentInstrumentStatus { get }

	/* The timestamp the payment instrument was last updated in the container. The timestamp format is ISO8601. */
	var lastUpdated: String { get }

	/* The timestamp the payment instrument was last used in the container. The timestamp format is ISO8601. Will be null if never used. */
	var lastUsed: String { get }

	/* A flag to indicate if this payment instrument is the primary instrument in the container. */
	var primary: Bool? { get }

	/* A flag to indicate if the merchant profile in the container allows the use of this payment instrument. */
	var allowed: Bool? { get }

	/* The PayPalApi email id. */
	var payPalId: String { get }

	/* The PayPalApi customer id. */
	var customerId: String { get }
}

public protocol PaymentAgreementDetails {
	/* The payment token of the payment agreement. The payment token is a unique identifier for the payment agreement. */
	var paymentToken: String { get }

	/* The status of the payment agreement in the container. */
	var status: PaymentInstrumentStatus { get }

	/* The timestamp the payment agreement was last updated in the container. The timestamp format is ISO8601. */
	var lastUpdated: String { get }

	/* The timestamp the payment agreement was last used in the container. The timestamp format is ISO8601. Will be null if never used. */
	var lastUsed: String { get }

	/* A flag to indicate if this payment instrument is the primary instrument in the container. Not used for payment agreements. */
	var primary: Bool? { get }

	/* A flag to indicate if the merchant profile in the container allows the use of this payment agreement. */
	var allowed: Bool? { get }

	/* The payment agreement type. */
	var type: PaymentAgreementTypeEnum { get }

	/* The payment agreement payment instrument id that will be used for the charges. */
	var paymentInstrumentId: String { get }

	/* The credit card scheme. */
	var scheme: String? { get }

	/* The suffix (last 4 digits) of the credit card number. */
	var cardSuffix: String? { get }

	/* The month of the expiry date of the credit card. */
	var expiryMonth: String? { get }

	/* The year of the expiry date of the credit card. */
	var expiryYear: String? { get }

	/* The payment agreement start date and time. The timestamp format is ISO8601. */
	var startDate: String { get }

	/* The payment agreement end date and time. The timestamp format is ISO8601. */
	var endDate: String { get }

	/* The payment agreement charge frequency. */
	var chargeFrequency: ChargeFrequencyEnum { get }

	/* The amount that will be charged at the frequency specified in the payment agreement. */
	var chargeAmount: Decimal { get }

	/* The current charge cycle number. */
	var chargeCycle: Decimal { get }

	/* A flag to indicate if the payment agreement is expired. */
	var expired: String { get }

	/* The URL of the endpoint to use to update the payment agreement. */
	var updateURL: String { get }

	var stepUp: StepUp? { get }
}

public protocol GooglePayDetails {
	/* The google pay payment instrument id. */
	var paymentInstrumentId: String { get }

	/* The google pay payment token. The payment token is a unique identifier for the payment instrument. */
	var paymentToken: String { get }

	/* The status of the payment instrument in the container. */
	var status: PaymentInstrumentStatus { get }

	/* The timestamp the payment instrument was last updated in the container. The timestamp format is ISO8601. */
	var lastUpdated: String { get }

	/* The timestamp the payment instrument was last used in the container. The timestamp format is ISO8601. Will be null if never used. */
	var lastUsed: String { get }

	/* A flag to indicate if this payment instrument is the primary instrument in the container. */
	var primary: Bool? { get }

	/* A flag to indicate if the merchant profile in the container allows the use of this payment instrument. */
	var allowed: Bool? { get }

	/* A flag to indicate if the Google Pay token is expired. */
	var expired: Bool? { get }

	/* This object will only be present if the Google Pay token is expired. Check the 'expired' flag for this status. */
	var stepUp: StepUp? { get }
}

public protocol ApplePayDetails {
	/* The apple pay payment instrument id. */
	var paymentInstrumentId: String { get }

	/* The apple pay payment token. The payment token is a unique identifier for the payment instrument. */
	var paymentToken: String { get }

	/* The status of the payment instrument in the container. */
	var status: PaymentInstrumentStatus { get }

	/* The timestamp the payment instrument was last updated in the container. The timestamp format is ISO8601. */
	var lastUpdated: String { get }

	/* The timestamp the payment instrument was last used in the container. The timestamp format is ISO8601. Will be null if never used. */
	var lastUsed: String { get }

	/* A flag to indicate if this payment instrument is the primary instrument in the container. */
	var primary: Bool? { get }

	/* A flag to indicate if the merchant profile in the container allows the use of this payment instrument. */
	var allowed: Bool? { get }
	var stepUp: StepUp { get }
}

public protocol StepUp {
	/* The type of the step up action. For apple pay this will be REFRESH_TOKEN. */
	var type: StepUpTypeEnum { get }

	/* A flag to indicate if this step up (action) is mandatory. */
	var mandatory: Bool? { get }

	/* The URL of the endpoint to use to update the apple pay token. */
	var url: String { get }
}

public enum StepUpTypeEnum : String {
	case REFRESH_TOKEN
}

public enum ChargeFrequencyEnum : String {
	case WEEKLY, FORTNIGHTLY, MONTHLY
}

public enum PaymentAgreementTypeEnum : String {
	case RECURRING, ADHOC, INSTALLMENT
}