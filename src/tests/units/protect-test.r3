Rebol [
	Title:   "Rebol protect test script"
	Author:  "Oldes"
	File: 	 %protect-test.r3
	Tabs:	 4
	Needs:   [%../quick-test-module.r3]
]

~~~start-file~~~ "Protect"

===start-group=== "Checks if protected data are really protected"
	data: #{cafe}
	protect data

	is-protected?: function[code][
		true? all [
			error? err: try code
			err/id = 'protected
		]
	]

	--test-- "clear"   --assert is-protected? [clear data]
	--test-- "append"  --assert is-protected? [append data #{0bad}]
	--test-- "insert"  --assert is-protected? [insert data #{0bad}]

	;@@ https://github.com/rebol/rebol-issues/issues/2321
	--test-- "encloak" --assert is-protected? [encloak data "key"]
	--test-- "decloak" --assert is-protected? [decloak data "key"]

===end-group===

~~~end-file~~~