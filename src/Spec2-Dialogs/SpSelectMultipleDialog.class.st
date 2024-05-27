"
A dialog that allow the users to select multiple choices from a list of `items`
"
Class {
	#name : 'SpSelectMultipleDialog',
	#superclass : 'SpAbstractCancelableMessageDialog',
	#instVars : [
		'table1',
		'selectedItems'
	],
	#category : 'Spec2-Dialogs',
	#package : 'Spec2-Dialogs'
}

{ #category : 'accessing' }
SpSelectMultipleDialog class >> defaultExtent [

	^ 450@300
]

{ #category : 'examples' }
SpSelectMultipleDialog class >> example [

	| presenter |
	presenter := self new.
	presenter
		title: 'Multiple select example';
		label: 'Select multiple classes';
		items: Smalltalk allClassesAndTraits;
		display: [ :each | each name ];
		displayIcon: [ :each | self iconNamed: each systemIconName ];
		onAccept: [ :dialog |
			dialog presenter inform: dialog presenter selectedItems asString ];
		openDialog
]

{ #category : 'examples' }
SpSelectMultipleDialog class >> exampleModal [

	| dialog selection |
	dialog := self new. 
	selection := dialog
		             title: 'Select multiple modal example';
		             label: 'Select multiple classes';
		             items: Smalltalk allClassesAndTraits;
		             display: [ :each | each name ];
		             displayIcon: [ :each |
			             self iconNamed: each systemIconName ];
		             openModal.

	selection ifNotNil: [ dialog inform: dialog selectedItems asString ]
]

{ #category : 'layout' }
SpSelectMultipleDialog >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: table1;
		add: label expand: false;
		yourself
]

{ #category : 'accessing' }
SpSelectMultipleDialog >> defaultTitle [

	^ 'Multiple request'
]

{ #category : 'api' }
SpSelectMultipleDialog >> display: aBlock [

	(table1 columns at: 3) evaluated: aBlock
]

{ #category : 'api' }
SpSelectMultipleDialog >> displayIcon: aBlock [
	(table1 columns at:2) evaluated: aBlock
]

{ #category : 'initialization' }
SpSelectMultipleDialog >> initialize [
	selectedItems := OrderedCollection new.
	super initialize
]

{ #category : 'initialization' }
SpSelectMultipleDialog >> initializePresenters [

	super initializePresenters.
	table1 := self newTable.

	table1
		addColumn: ((SpCheckBoxTableColumn
				  title: ' '
				  evaluated: [ :item | selectedItems includes: item ])
				 onActivation: [ :item | selectedItems add: item ];
				 onDeactivation: [ :item | selectedItems remove: item ];
				 width: 20;
				 yourself);
		addColumn: ((SpImageTableColumn title: ' ')
				 width: 20;
				 yourself);
		addColumn: (SpStringTableColumn title: ' ');
		items: self items;
		beResizable
]

{ #category : 'accessing' }
SpSelectMultipleDialog >> items [
	^ table1 items
]

{ #category : 'api' }
SpSelectMultipleDialog >> items: aCollection [

	table1 items: aCollection
]

{ #category : 'accessing' }
SpSelectMultipleDialog >> selectedItems [
	^ selectedItems
]
