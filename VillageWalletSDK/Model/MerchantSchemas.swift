import UIKit

public protocol MerchantSchemas {

}

public protocol MerchantSchemaSummaries: MerchantSchemas {
	func schemas() -> [MerchantSchemaSummary]
}

public protocol MerchantSchemaSummary {
	func schemaId() -> String

	func type() -> String

	func description() -> String?
}

public protocol MerchantSchema {
	func schema() -> [String: AnyObject]

	func type() -> String?

	func description() -> String?

	func created() -> Date?
}