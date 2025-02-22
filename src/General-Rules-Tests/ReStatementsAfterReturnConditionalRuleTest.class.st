Class {
	#name : 'ReStatementsAfterReturnConditionalRuleTest',
	#superclass : 'ReAbstractRuleTestCase',
	#category : 'General-Rules-Tests-Migrated',
	#package : 'General-Rules-Tests',
	#tag : 'Migrated'
}

{ #category : 'tests' }
ReStatementsAfterReturnConditionalRuleTest >> testRule [

	| critiques |
	self class
		compile: 'method 1 = 1 ifTrue: [ ^ 1 ] ifFalse: [ ^ 2 ]. 2'
		classified: 'test-helper'.
	[
	critiques := self myCritiquesOnMethod: self class >> #method.
	self assert: critiques size equals: 1 ] ensure: [
		(self class >> #method) removeFromSystem ]
]

{ #category : 'tests' }
ReStatementsAfterReturnConditionalRuleTest >> testRuleNotViolated [

	| critiques |
	self class
		compile: 'method 1 = 1 ifTrue: [ ^ 1 ] ifFalse: [ ^ 2 ].'
		classified: 'test-helper'.
	[
	critiques := self myCritiquesOnMethod: self class >> #method.
	self assertEmpty: critiques ] ensure: [
		(self class >> #method) removeFromSystem ]
]
