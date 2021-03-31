import UIKit

public protocol SchemasRepository {
	/**
	 Retrieve the list of currently usable schemas previously added for the merchant
	 */
	func list(completion: @escaping ApiCompletion<MerchantSchemaSummaries>)

	/**
	 Retrieve details for a specific schema

	 - Parameter schemaId: The schema to retrieve
	 */
	func getById(schemaId: String, completion: @escaping ApiCompletion<MerchantSchema>)

	/**
	 Create a new schema for the merchant

	 - Parameter schema: The schema definition
	 */
	func create(
		schema: MerchantSchema,
		completion: @escaping ApiCompletion<MerchantSchemaSummary>
	)
}