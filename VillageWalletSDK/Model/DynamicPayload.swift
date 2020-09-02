import UIKit

public protocol DynamicPayload {
	var schemaId: String? { get }

	var payload: [String: AnyObject] { get }
}
