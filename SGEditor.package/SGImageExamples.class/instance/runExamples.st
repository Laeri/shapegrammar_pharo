running
runExamples
	<script: 'SGImageExamples new runExamples'>
	[ 
	Transcript show: 'Start Running Package examples';cr.
	(SGImageExamples allSelectorsInProtocol: 'examples')
		do: [ :selector | 
			Transcript show: 'Start: ', selector asString;cr.
			SGImageExamples new perform: selector.
				Transcript show: 'End: ', selector asString;cr.
			 ].
		Transcript show: 'Finish Running Package examples';cr.
		 ] fork