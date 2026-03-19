import type { Question } from '../../types'
import { MultipleChoice } from './MultipleChoice'

export interface QuestionRendererProps {
  question: Question
  onAnswered: (isCorrect: boolean) => void
  /** Optional handler for click / correct / wrong sound effects */
  onPlaySound?: (type: 'click' | 'correct' | 'wrong') => void
  disabled?: boolean
}

export function QuestionRenderer({
  question,
  onAnswered,
  onPlaySound,
  disabled,
}: QuestionRendererProps) {
  switch (question.type) {
    case 'multiple_choice':
      return (
        <MultipleChoice
          question={question}
          onAnswer={onAnswered}
          onPlaySound={onPlaySound}
          disabled={disabled}
        />
      )

    default:
      return (
        <div className="p-6 rounded-box-lg bg-white shadow-box">
          <p className="text-base text-pb-text-light">
            El tipo de pregunta "{question.type}" aún no está implementado.
          </p>
        </div>
      )
  }
}
