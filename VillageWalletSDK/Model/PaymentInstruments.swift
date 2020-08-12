import UIKit

public enum PaymentInstrumentStatus {
	case UNVERIFIED_PERSISTENT
	case VERIFIED

	public static func valueOf(value: String) -> PaymentInstrumentStatus? {
		switch(value.uppercased()) {
		case "UNVERIFIED_PERSISTENT":
			return PaymentInstrumentStatus.UNVERIFIED_PERSISTENT

		case "VERIFIED":
			return PaymentInstrumentStatus.VERIFIED

		default:
			return nil
		}
	}
}

public protocol AllPaymentInstruments: PaymentInstruments {
	func everydayPay() -> PaymentInstruments?
}

public protocol PaymentInstruments {
	func creditCards() -> [CreditCard]
	func giftCards() -> [GiftCard]
}

public protocol PaymentInstrument {
	func allowed() -> Bool
	func cardSuffix() -> String
	func lastUpdated() -> Date
	func lastUsed() -> Date?
	func paymentInstrumentId() -> String
	func paymentToken() -> String
	func primary() -> Bool
	func status() -> PaymentInstrumentStatus?

	/** what Wallet the instrument is from */
	func wallet() -> Wallet
}

public protocol CreditCard: PaymentInstrument {
	func cardName() -> String
	func cvvValidated() -> Bool
	func expired() -> Bool
	func expiryMonth() -> String
	func expiryYear() -> String
	func requiresCVV() -> Bool
	func scheme() -> String
	func updateURL() -> URL
	func stepUp() -> CreditCardStepUp
}

public protocol GiftCard: PaymentInstrument {
	func programName() -> String
	func stepUp() -> GiftCardStepUp?
}

public protocol CreditCardStepUp {
	func type() -> String
	func mandatory() -> Bool
	func url() -> URL
}

public protocol GiftCardStepUp {
	func type() -> String
	func mandatory() -> Bool
}