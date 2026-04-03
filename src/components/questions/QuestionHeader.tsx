import type { Question } from '../../types'

interface Props {
  question: Question
}

function renderFormattedText(str: string) {
  const parts = str.split(/('[^']+')/g)
  return parts.map((part, i) => {
    if (part.startsWith("'") && part.endsWith("'")) {
      const innerMatch = part.slice(1, -1)
      return (
        <span key={i} className="font-extrabold text-blue-600 underline decoration-2 underline-offset-4 decoration-blue-200">
          '{innerMatch}'
        </span>
      )
    }
    return <span key={i}>{part}</span>
  })
}

export function QuestionHeader({ question }: Props) {
  if (!question.question_text) return null

  const text = question.question_text
  const colonIndex = text.indexOf(':')

  if (colonIndex === -1) {
    return (
      <div className="flex items-center justify-center min-h-24 py-4 text-center">
        <h2 className="text-xl sm:text-2xl font-black text-pb-dark leading-tight px-2 tracking-tight">
          {renderFormattedText(text)}
        </h2>
      </div>
    )
  }

  const preColon = text.substring(0, colonIndex).trim()
  const postColon = text.substring(colonIndex + 1).trim()

  return (
    <div className="flex flex-col items-center justify-center min-h-24 py-4 gap-2 text-center">
      <p className="text-xs sm:text-sm font-bold text-slate-500 uppercase tracking-widest px-2">
        {preColon}:
      </p>
      <h2 className="text-xl sm:text-2xl font-black text-pb-dark leading-tight px-2 tracking-tight">
        {renderFormattedText(postColon)}
      </h2>
    </div>
  )
}
