import { Component, type ErrorInfo, type ReactNode } from 'react'
import { Mascot } from './Mascot'

interface ErrorBoundaryProps {
  children: ReactNode
}

interface ErrorBoundaryState {
  hasError: boolean
  error: Error | null
}

/**
 * Top-level error boundary — a rendering crash shows a friendly screen
 * instead of a blank white page.
 */
export class ErrorBoundary extends Component<ErrorBoundaryProps, ErrorBoundaryState> {
  state: ErrorBoundaryState = { hasError: false, error: null }
  private resetHandler = () => this.setState({ hasError: false, error: null })

  static getDerivedStateFromError(error: Error): ErrorBoundaryState {
    return { hasError: true, error }
  }

  componentDidCatch(error: Error, info: ErrorInfo) {
    console.error('[ErrorBoundary] Uncaught render error:', error, info.componentStack)
  }

  render() {
    if (!this.state.hasError) {
      return this.props.children
    }

    return (
      <div className="h-dvh w-full flex flex-col items-center justify-center gap-4 px-6 text-center bg-pb-bg">
        <Mascot mood="sad" size="xl" />
        <h1 className="text-2xl font-black text-pb-dark">¡Ups! Algo se rompió</h1>
        <p className="text-sm font-bold text-pb-text-light max-w-64 leading-relaxed">
          Boxi tuvo un pequeño accidente. Puedes intentar de nuevo o volver al menú.
        </p>

        {import.meta.env.DEV && this.state.error && (
          <pre className="text-xs text-left text-red-600 bg-white/70 rounded-xl p-3 max-w-md overflow-auto max-h-40 ring-1 ring-black/4">
            {this.state.error.message}
          </pre>
        )}

        <div className="flex gap-3 mt-2">
          <button
            onClick={this.resetHandler}
            className="px-6 py-3 rounded-2xl bg-linear-to-b from-[#FFB347] to-pb-amber text-white font-bold shadow-[0_4px_0_0_#c97a1a] active:translate-y-[3px] active:shadow-[0_1px_0_0_#c97a1a] transition-all cursor-pointer"
          >
            Reintentar
          </button>
          <button
            onClick={() => window.location.assign('/menu')}
            className="px-6 py-3 rounded-2xl bg-white/70 text-pb-dark font-bold shadow-soft ring-1 ring-black/4 active:translate-y-[1px] transition-all cursor-pointer"
          >
            Volver al menú
          </button>
        </div>
      </div>
    )
  }
}
