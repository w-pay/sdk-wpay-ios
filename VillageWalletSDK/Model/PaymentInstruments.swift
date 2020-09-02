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
	var everydayPay: PaymentInstruments? { get }
}

public protocol PaymentInstruments {
	var creditCards: [CreditCard] { get }
	var giftCards: [GiftCard] { get }
}

public protocol PaymentInstrumentIdentifier {
	var paymentInstrumentId: String { get }

	/** what Wallet the instrument is from */
	var wallet: Wallet { get }
}

public protocol PaymentInstrument: PaymentInstrumentIdentifier {
	var allowed: Bool { get }
	var cardSuffix: String { get }
	var lastUpdated: Date { get }
	var lastUsed: Date? { get }
	var paymentToken: String { get }
	var primary: Bool { get }
	var status: PaymentInstrumentStatus? { get }
}

public protocol CreditCard: PaymentInstrument {
	var cardName: String { get }
	var cvvValidated: Bool { get }
	var expired: Bool { get }
	var expiryMonth: String { get }
	var expiryYear: String { get }
	var requiresCVV: Bool { get }
	var scheme: String { get }
	var updateURL: URL { get }
	var stepUp: CreditCardStepUp { get }
}

public protocol GiftCard: PaymentInstrument {
	var programName: String { get }
	var stepUp: GiftCardStepUp? { get }
}

public protocol CreditCardStepUp {
	var type: String { get }
	var mandatory: Bool { get }
	var url: URL { get }
}

public protocol GiftCardStepUp {
	var type: String { get }
	var mandatory: Bool { get }
}

public protocol SecondaryPaymentInstrument {
	var paymentInstrumentId: String { get }

	var amount: Decimal { get }
}