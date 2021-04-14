import UIKit

/**
	Verification state for a `PaymentInstrument`
 */
public enum PaymentInstrumentStatus: String {
	case UNVERIFIED_PERSISTENT
	case VERIFIED
}

/**
	All the possible `PaymentInstrument`s that a customer might have in a wallet.
 */
public protocol WalletContents: PaymentInstruments {
	/**
		A list of payment instruments stored in the customers EverydayPay wallet

		- Returns: `nil` if the wallet is not the customers EverydayPay wallet.
	*/
	var everydayPay: PaymentInstruments? { get }
}

/**
	List of grouped payment instruments.
 */
public protocol PaymentInstruments {
	/** List of added credit cards */
	var creditCards: [CreditCard] { get }

	/** List of added gift cards */
	var giftCards: [GiftCard] { get }
}

/**
	Common properties to all `PaymentInstruments`
 */
public protocol PaymentInstrument {
	/** The payment instrument id. */
	var paymentInstrumentId: String { get }

	/** Indicates if the merchant profile in the container allows the use of this payment instrument. */
	var allowed: Bool { get }

	/** The timestamp the payment instrument was last updated in the container. */
	var lastUpdated: Date { get }

	/** The timestamp the payment instrument was last used in the container. */
	var lastUsed: Date? { get }

	/** The payment token is a unique identifier for the payment instrument. */
	var paymentToken: String { get }

	/** Indicates that this payment instrument is the primary instrument in the container. */
	var primary: Bool { get }

	/** The status of the payment instrument in the container. */
	var status: PaymentInstrumentStatus? { get }
}

public protocol CardPaymentInstrument: PaymentInstrument {
	/** The suffix (last 4 digits) of the card number. */
	var cardSuffix: String { get }
}

/**
	An added credit card
 */
public protocol CreditCard: CardPaymentInstrument {
	/** The nickname of the credit card instrument in the container. */
	var cardName: String { get }

	/** Indicates if the CVV of the credit card has been validated. */
	var cvvValidated: Bool { get }

	/** Indicates if the credit card is expired. */
	var expired: Bool { get }

	/** The month of the expiry date of the credit card. */
	var expiryMonth: String { get }

	/** The year of the expiry date of the credit card. */
	var expiryYear: String { get }

	/** Indicates if payments with this credit card requires a CVV check. */
	var requiresCVV: Bool { get }

	/** The credit card scheme. */
	var scheme: String { get }

	/** The URL of an iframe. This iframe is used to capture a credit card expiry and CVV. */
	var updateURL: URL { get }

	/** Whether a `ChallengeResponse` is required to make a payment with this card */
	var stepUp: CreditCardStepUp { get }
}

/**
	An added gift card.
 */
public protocol GiftCard: CardPaymentInstrument {
	/** The gift card program name. */
	var programName: String { get }

	/** Whether a `ChallengeResponse` is required to make a payment with this card */
	var stepUp: GiftCardStepUp? { get }
}

/**
	Details of what step up is required to use a `CreditCard`
 */
public protocol CreditCardStepUp {
	/** This will be CAPTURE_CVV which identifies that the consumer must capture the CVV prior to payment. */
	var type: String { get }

	/** Indicates if this step up is mandatory. */
	var mandatory: Bool { get }

	/** The URL of an iframe. This iframe is used to capture a credit card expiry and CVV or CVV only. */
	var url: URL { get }
}

/**
	Details of what step up is required to use a `GiftCard`
 */
public protocol GiftCardStepUp {
	/** This will be REQUIRE_PASSCODE which identifies that the consumer must capture the PIN prior to payment. */
	var type: String { get }

	/** Indicates if this step up is mandatory. */
	var mandatory: Bool { get }
}

/**
	Used to identify other `PaymentInstrument`s to be used as part of a payment.
 */
public protocol SecondaryPaymentInstrument {
	/** The ID of the payment instrument */
	var paymentInstrumentId: String { get }

	/** The amount of the payment to be paid using this instrument. */
	var amount: Decimal { get }
}

public protocol IndividualPaymentInstrument: PaymentInstrument {
	/** The type of the payment instrument. */
	var paymentInstrumentType: String { get }

	var paymentInstrumentDetail: IndividualPaymentInstrumentDetail { get }

	/** An encrypted JSON object containing sensitive data */
	var cipherText: String? { get }
}

public protocol IndividualPaymentInstrumentDetail {
	/** The gift card program name. */
	var programName: String { get }

	/** What [ChallengeResponse] is required to make a payment with this instrument */
	var stepUp: GiftCardStepUp { get }
}