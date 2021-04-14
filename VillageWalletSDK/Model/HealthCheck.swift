import UIKit

/**
	Result of checking the health of the API server
 */
public protocol HealthCheck {
	/**
		Health check result

	  - Returns: `nil` if invalid API data received.
	 */
	var result: HealthCheckStatus? { get }
}

/**
	Possible health states that the API server can be in.
 */
public enum HealthCheckStatus: String {
	/** The API server is healthy */
	case SUCCESS
}
