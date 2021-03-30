import UIKit

/**
 Fraud check response
 */
public protocol DigitalPayFraudPayload {
	/* The fraud check provider. */
	var provider: String { get }

	/* The fraud check version. */
	var version: String { get }

	/* The fraud check message format. */
	var format: DigitalPayFraudMessageFormat { get }

	/* The fraud check message format. */
	var responseFormat: DigitalPayFraudMessageFormat { get }

	/* The fraud check message. */
	var message: String { get }
}

public enum DigitalPayFraudMessageFormat: String {
	case ZIP_BASE_64_ENCODED, XML
}