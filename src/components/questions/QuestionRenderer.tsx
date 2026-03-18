import type { Question } from '../../types'
import { MultipleChoice } from './MultipleChoice'

interface QuestionRendererProps {
	question: Question
	onAnswer: (isCorrect: boolean) => void
	onNext: () => void
	onPlaySound?: (type: 'click' | 'correct' | 'wrong') => void
	disabled?: boolean
}

export function QuestionRenderer({
	question,
	onAnswer,
	onNext,
	onPlaySound,
	disabled,
}: QuestionRendererProps) {
	const handleAnswered = (isCorrect: boolean) => {
		onAnswer(isCorrect)
		onNext()
	}

	switch (question.type) {
		case 'multiple_choice':
			return (
				<MultipleChoice
					question={question}
					onAnswer={handleAnswered}
					onPlaySound={onPlaySound}
					disabled={disabled}
				/>
			)

		default:
			return (
				<div className="p-6 rounded-box-lg bg-white shadow-box">
					<p className="text-base text-pb-text-light">
						Question type "{question.type}" is not implemented yet.
					</p>
				</div>
			)
	}
}
