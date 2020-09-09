import UIKit

/**
 :nodoc:
*/
public protocol MerchantSchemas {

}

/**
	List of merchant schemas
 */
public protocol MerchantSchemaSummaries: MerchantSchemas {
	/** A list of currently valid schemas for this merchant */
	var schemas: [MerchantSchemaSummary] { get }
}

/**
	Summary information about a `MerchantSchema`
 */
public protocol MerchantSchemaSummary {
	/** The unique ID assigned to the schema */
	var schemaId: String { get }

	/** The type of the schema e.g. pos, merchant */
	var type: String { get }

	/** A description for the schema. */
	var description: String? { get }
}

/**
	Details about a particular schema
 */
public protocol MerchantSchema {
	/** The schema content formatted according to JSON Schema standards */
	var schema: [String: AnyObject] { get }

	/** The type of the schema e.g. pos, merchant */
	var type: String? { get }

	/** A description for the schema */
	var description: String? { get }

	/** The timestamp when the schema was created */
	var created: Date? { get }
}