
import type { Question } from '../../types'
import { MultipleChoice } from './MultipleChoice'
import { ImageMatch } from './ImageMatch'
import { Listening } from './Listening'
import { FillInBlank } from './FillInBlank'
import { WordOrder } from './WordOrder'

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
    case 'image_match':
      return (
        <ImageMatch
          question={question}
          onAnswer={onAnswered}
          onPlaySound={onPlaySound}
          disabled={disabled}
        />
      )
    case 'listening':
      return (
        <Listening
          question={question}
          onAnswer={onAnswered}
          onPlaySound={onPlaySound}
          disabled={disabled}
        />
      )
    case 'fill_blank':
      return (
        <FillInBlank
          question={question}
          onAnswer={onAnswered}
          onPlaySound={onPlaySound}
          disabled={disabled}
        />
      )
    case 'word_order':
      return (
        <WordOrder
          question={question}
          onAnswer={onAnswered}
          onPlaySound={onPlaySound}
          disabled={disabled}
        />
      )

    default:
      return (
        <div className="p-4 bg-red-50 text-red-500 rounded-xl">
          Unsupported question type: {question.type}
        </div>
      )
  }
}
