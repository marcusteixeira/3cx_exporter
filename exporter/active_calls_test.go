package exporter

import (
	"encoding/json"
	"io/ioutil"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestCalls(t *testing.T) {
	assert := assert.New(t)
	require := require.New(t)

	data, err := ioutil.ReadFile("fixtures/ActiveCalls.json")
	require.NoError(err)

	response := struct {
		List []ActiveCalls `json:"list"`
	}{}

	require.NoError(json.Unmarshal(data, &response))
	require.Len(response.List, 1)
}