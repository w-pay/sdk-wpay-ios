import UIKit

/**
  Digital Pay Fraud Payload, set to null to skip the fraud check.
 */
public protocol FraudPayload {
	/** The fraud check message */
	var message: String { get }

	/** The fraud check provider. */
	var provider: String { get }

	/** The fraud check message format */
	var format: FraudPayloadFormat { get }

	/** The fraud check response message format */
	var responseFormat: FraudPayloadFormat { get }

	/** The fraud check version */
	var version: String { get }
}

/**
 Possible fraud payload formats
 */
public enum FraudPayloadFormat: String {
	/** ZIP BASE64 Formatting */
	case ZIP_BASE_64_ENCODED

	/** XML Formatting */
	case XML
}