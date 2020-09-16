import UIKit

/**
	A payload of key/value pairs that is can be validated by a schema.
 */
public protocol DynamicPayload {
	/** The ID of the previously configured schema that will be used to validate the contents of the payload. */
	var schemaId: String? { get }

	/** The payload aligned to the supplied schema. */
	var payload: [String: AnyObject] { get }
}
