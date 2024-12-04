Button(action: {
    handleSubmit(name: name, age: age) {success, message in
        print("Data Submitted")
    }
}) {
    Text("Submit")
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
}

func addDestination(stop1: String, stop2: String, final: String, completion: @escaping (Bool, String) -> Void) {
    guard let url = URL(string: "https://vutran.dev.fast.sheridanc.on.ca/iOSClassA3/addDestination.php") else {
        completion(false, "Invalid URL")
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    // Set the content type to application/json
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // Prepare the data to be sent as JSON
    let parameters: [String: Any] = [
        "Stop1": stop1,
        "Stop2": stop2,
        "Final": final
    ]
    
    do {
        // Convert parameters to JSON data
        let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
        request.httpBody = jsonData
    } catch {
        completion(false, "Error converting data to JSON: \(error.localizedDescription)")
        return
    }

    // Send the request
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            completion(false, "Error: \(error.localizedDescription)")
            return
        }
        guard let data = data else {
            completion(false, "No data received")
            return
        }
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                let success = json["success"] as? Bool,
                let message = json["message"] as? String {
                completion(success, message)
            } else {
                completion(false, "Invalid response format")
            }
        } catch {
            completion(false, "Error parsing response: \(error.localizedDescription)")
        }
    }.resume()
}