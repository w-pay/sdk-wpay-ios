import UIKit

public protocol PaymentTransactionType {
	/** The container transaction type to use for credit card instruments. */
	var creditCard: PreauthPurchase? { get }

	/** The container transaction type to use for gift card instruments. */
	var giftCard: Purchase? { get }

	/** The container transaction type to use for paypal instruments. */
	var payPal: Purchase? { get }

	/** The container transaction type to use for google pay instruments. */
	var googlePay: GooglePayTransactionDetail? { get }

	/** The container transaction type to use for apple pay instruments. */
	var applePay: ApplePayTransactionDetail? { get }
}

public protocol GooglePayTransactionDetail {
	/** The container transaction type to use for google pay credit card instruments. */
	var creditCard: PreauthPurchase { get }
	/** The container transaction type to use for google pay debit card instruments. */
	var debitCard: Purchase { get }
}

public protocol ApplePayTransactionDetail {
	/** The container transaction type to use for apple pay credit card instruments. */
	var creditCard: PreauthPurchase { get }

	/** The container transaction type to use for apple pay debit card instruments. */
	var debitCard: Purchase { get }
}

public enum PreauthPurchase: String {
	case PREAUTH, PURCHASE
}

public enum Purchase: String {
	case PURCHASE
}
