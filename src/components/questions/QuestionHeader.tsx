import type { Question } from '../../types'

interface Props {
  question: Question
}

export function QuestionHeader({ question }: Props) {
  if (!question.question_text) return null

  const text = question.question_text
  const colonIndex = text.indexOf(':')

  if (colonIndex === -1) {
    return (
      <div className="flex items-center justify-center min-h-24 py-4">
        <h2 className="text-xl sm:text-2xl font-black text-pb-dark leading-tight px-2 tracking-tight">
          {text}
        </h2>
      </div>
    )
  }

  const preColon = text.substring(0, colonIndex).trim()
  const postColon = text.substring(colonIndex + 1).trim()

  return (
    <div className="flex flex-col items-center justify-center min-h-24 py-4 gap-2">
      <p className="text-xs sm:text-sm font-bold text-slate-500 uppercase tracking-widest px-2">
        {preColon}:
      </p>
      <h2 className="text-xl sm:text-2xl font-black text-pb-dark leading-tight px-2 tracking-tight">
        {postColon}
      </h2>
    </div>
  )
}
