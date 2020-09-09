import UIKit

/**
	Can be used to perform Administration functions on the API
 */
public protocol VillageAdministrationApiRepository: Configurable {
	/**
		Check the health/status of the API
	 */
	func checkHealth(completion: @escaping ApiCompletion<HealthCheck>)
}
