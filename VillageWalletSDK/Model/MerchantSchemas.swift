import UIKit

public protocol MerchantSchemas {

}

public protocol MerchantSchemaSummaries: MerchantSchemas {
	var schemas: [MerchantSchemaSummary] { get }
}

public protocol MerchantSchemaSummary {
	var schemaId: String { get }

	var type: String { get }

	var description: String? { get }
}

public protocol MerchantSchema {
	var schema: [String: AnyObject] { get }

	var type: String? { get }

	var description: String? { get }

	var created: Date? { get }
}