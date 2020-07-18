// Code generated by counterfeiter. DO NOT EDIT.
package tokenfakes

import (
	"sync"

	"github.com/concourse/concourse/skymarshal/token"
)

type FakeGenerator struct {
	GenerateAccessTokenStub        func() (string, error)
	generateAccessTokenMutex       sync.RWMutex
	generateAccessTokenArgsForCall []struct {
	}
	generateAccessTokenReturns struct {
		result1 string
		result2 error
	}
	generateAccessTokenReturnsOnCall map[int]struct {
		result1 string
		result2 error
	}
	invocations      map[string][][]interface{}
	invocationsMutex sync.RWMutex
}

func (fake *FakeGenerator) GenerateAccessToken() (string, error) {
	fake.generateAccessTokenMutex.Lock()
	ret, specificReturn := fake.generateAccessTokenReturnsOnCall[len(fake.generateAccessTokenArgsForCall)]
	fake.generateAccessTokenArgsForCall = append(fake.generateAccessTokenArgsForCall, struct {
	}{})
	fake.recordInvocation("GenerateAccessToken", []interface{}{})
	fake.generateAccessTokenMutex.Unlock()
	if fake.GenerateAccessTokenStub != nil {
		return fake.GenerateAccessTokenStub()
	}
	if specificReturn {
		return ret.result1, ret.result2
	}
	fakeReturns := fake.generateAccessTokenReturns
	return fakeReturns.result1, fakeReturns.result2
}

func (fake *FakeGenerator) GenerateAccessTokenCallCount() int {
	fake.generateAccessTokenMutex.RLock()
	defer fake.generateAccessTokenMutex.RUnlock()
	return len(fake.generateAccessTokenArgsForCall)
}

func (fake *FakeGenerator) GenerateAccessTokenCalls(stub func() (string, error)) {
	fake.generateAccessTokenMutex.Lock()
	defer fake.generateAccessTokenMutex.Unlock()
	fake.GenerateAccessTokenStub = stub
}

func (fake *FakeGenerator) GenerateAccessTokenReturns(result1 string, result2 error) {
	fake.generateAccessTokenMutex.Lock()
	defer fake.generateAccessTokenMutex.Unlock()
	fake.GenerateAccessTokenStub = nil
	fake.generateAccessTokenReturns = struct {
		result1 string
		result2 error
	}{result1, result2}
}

func (fake *FakeGenerator) GenerateAccessTokenReturnsOnCall(i int, result1 string, result2 error) {
	fake.generateAccessTokenMutex.Lock()
	defer fake.generateAccessTokenMutex.Unlock()
	fake.GenerateAccessTokenStub = nil
	if fake.generateAccessTokenReturnsOnCall == nil {
		fake.generateAccessTokenReturnsOnCall = make(map[int]struct {
			result1 string
			result2 error
		})
	}
	fake.generateAccessTokenReturnsOnCall[i] = struct {
		result1 string
		result2 error
	}{result1, result2}
}

func (fake *FakeGenerator) Invocations() map[string][][]interface{} {
	fake.invocationsMutex.RLock()
	defer fake.invocationsMutex.RUnlock()
	fake.generateAccessTokenMutex.RLock()
	defer fake.generateAccessTokenMutex.RUnlock()
	copiedInvocations := map[string][][]interface{}{}
	for key, value := range fake.invocations {
		copiedInvocations[key] = value
	}
	return copiedInvocations
}

func (fake *FakeGenerator) recordInvocation(key string, args []interface{}) {
	fake.invocationsMutex.Lock()
	defer fake.invocationsMutex.Unlock()
	if fake.invocations == nil {
		fake.invocations = map[string][][]interface{}{}
	}
	if fake.invocations[key] == nil {
		fake.invocations[key] = [][]interface{}{}
	}
	fake.invocations[key] = append(fake.invocations[key], args)
}

var _ token.Generator = new(FakeGenerator)
