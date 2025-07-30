Class {
	#name : 'SpTreePresenterTest',
	#superclass : 'SpAbstractTreePresenterTest',
	#category : 'Spec2-Tests-Core-Widgets',
	#package : 'Spec2-Tests',
	#tag : 'Core-Widgets'
}

{ #category : 'accessing' }
SpTreePresenterTest >> classToTest [

	^ SpTreePresenter
]

{ #category : 'tests' }
SpTreePresenterTest >> testWhenSelectedItemChangedDoNotFiredIfWeSelectTheSameElementsInMultipleSelection [

	| count |
	count := 0.
	presenter beMultipleSelection.

	presenter selectPaths: #( #( 1 ) #( 2 1 ) ).

	presenter whenSelectedItemChangedDo: [ :item | count := count + 1 ].

	presenter selectPaths: #( #( 1 ) #( 2 1 ) ).

	self assert: count equals: 0
]

{ #category : 'tests' }
SpTreePresenterTest >> testWhenSelectedItemChangedDoNotFiredIfWeSelectTheSameElementsWithDifferentCollectionInMultipleSelection [

	| count |
	count := 0.
	presenter beMultipleSelection.

	presenter selectPaths: #( #( 1 ) #( 2 1 ) ).

	presenter whenSelectedItemChangedDo: [ :item | count := count + 1 ].

	presenter selectPaths: #( #( 1 ) #( 2 1 ) ) asOrderedCollection.

	self assert: count equals: 0
]
