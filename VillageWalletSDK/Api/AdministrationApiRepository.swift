import UIKit

/**
	Can be used to perform Administration functions on the API
 */
public protocol AdministrationApiRepository {
	/**
		Check the health/status of the API
	 */
	func checkHealth(completion: @escaping ApiCompletion<HealthCheck>)
}
