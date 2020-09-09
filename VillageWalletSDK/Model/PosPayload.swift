import UIKit

/**
	Payload describing the specific POS system.
 */
public protocol PosPayload {
	/** The ID of the previously configured schema that will be used to validate the contents of the payload */
	var schemaId: String? { get }

	/** The contents of the message */
	var payload: [String: AnyObject] { get }
}
