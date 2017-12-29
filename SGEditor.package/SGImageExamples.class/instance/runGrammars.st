running
runGrammars
	<script: 'SGImageExamples new runGrammars'>
	[ 
	Transcript show: 'Start Running Package grammars';cr.
	(SGImageExamples allSelectorsInProtocol: 'grammars')
		do: [ :selector | 
			Transcript show: 'Start: ', selector asString;cr.
			SGImageExamples new perform: selector.
			Transcript show: 'End: ', selector asString;cr.
			 ].
		Transcript show: 'Start Running Package grammars';cr.
		 ] fork