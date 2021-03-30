import UIKit

public protocol AllowedPaymentMethodsGiftCard {
	/** The gift card bin numbers that are allowed for the relevant merchant. This does not indicate sub-bins, ie. exact gift card programs. */
	var allowedBins: [String] { get }

	/** This property indicates the status of the gift card service in the container. */
	var serviceStatus: ServiceStatus { get }

	/** Flag to indicate if the pin is always required for gift card transactions. */
	var pinAlwaysRequired: Bool? { get }
}

public enum ServiceStatus : String {
	case ENABLED, DISABLED
}

public enum TransactionTypeEnum : String {
	case PREAUTH, PURCHASE
}

public protocol AllowedPaymentMethodsCreditCard {
	/** The allowed networks (schemes) for credit card transactions. */
	var allowedNetworks: [String] { get }

	var allowedTransactionTypes: [TransactionTypeEnum] { get }

	/** This property indicates the status of the credit card service in the container. */
	var serviceStatus: ServiceStatus { get }
}

public protocol AllowedPaymentMethodsPaypal {
	/** The paypal client token used for configuration and authorization of paypal transactions. */
	var clientToken: String { get }

	/** This property indicates the status of the paypal service in the container. */
	var serviceStatus: ServiceStatus { get }
}

public protocol AllowedPaymentMethodsGooglePay {
	/* The public key required by the Google Pay wallet. */
	var publicKey: String { get }

	/* The public key hash required by the Google Pay wallet. */
	var publicKeyHash: String { get }

	/* The expiry timestamp of the public key hash. The timestamp format is milliseconds since epoch. */
	var publicKeyExpiry: Decimal { get }

	/* The merchant id required by the Google Pay wallet. */
	var merchantId: String { get }

	/* The merchant name required by the Google Pay wallet. */
	var merchantName: String { get }

	var creditCard: Card { get }

	var debitCard: Card { get }

	/* This property indicates the status of the google pay service in the container. */
	var serviceStatus: ServiceStatus { get }
}

public protocol AllowedPaymentMethodsApplePay {
	var creditCard: Card { get }
	var debitCard: Card { get }

	/* This property indicates the status of the apple pay service in the container. */
	var serviceStatus: ServiceStatus { get }
}

public protocol Card {
	/* The allowed networks (schemes) for debit card transactions. */
	var allowedNetworks: [String] { get }

	/* The allowed transaction types for debit card transactions. */
	var allowedTransactionTypes: [TransactionTypeEnum] { get }
}

/**
 The JSON response structure of the Merchant Profile endpoint.
 */
public protocol MerchantProfileResponse {
	var allowedPaymentMethods: AllowedPaymentMethods { get }
}

public protocol AllowedPaymentMethods {
	/** The presence of this object in the response indicates that a gift card is an allowed payment method and instrument in the container for the relevant merchant. */
	var giftCard: AllowedPaymentMethodsGiftCard { get }

	/** The presence of this object in the response indicates that a credit card is an allowed payment method and instrument in the container for the relevant merchant. */
	var creditCard: AllowedPaymentMethodsCreditCard { get }

	/** The presence of this object in the response indicates that paypal is an allowed payment method and instrument in the container for the relevant merchant. */
	var paypal: AllowedPaymentMethodsPaypal { get }

	/* The presence of this object in the response indicates that google pay is an allowed payment method and instrument in the container for the relevant merchant. */
	var googlePay: AllowedPaymentMethodsGooglePay { get }

	/* The presence of this object in the response indicates that apple pay is an allowed payment method and instrument in the container for the relevant merchant. */
	var applePay: AllowedPaymentMethodsApplePay { get }
}
