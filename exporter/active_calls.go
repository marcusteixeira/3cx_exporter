package exporter

// Trunk represents a SIP trunk
type Calls struct {
	Caller   string
	Calle    string
	Status 	 string
}

// ActiveCalls fetches the calls list
func (api *API) ActiveCalls() ([]ActiveCalls, error) {
	response := struct {
		List []ActiveCalls `json:"list"`
	}{}

	err := api.getResponse("ActiveCalls", &response)
	if err != nil {
		return nil, err
	}

	return response.List, nil
}