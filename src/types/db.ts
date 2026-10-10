export type Json = string | number | boolean | null | { [key: string]: Json | undefined } | Json[]

export type Database = {
  public: {
    Tables: {
      questions: {
        Row: {
          created_at: string | null
          data: Json | null
          hint: string | null
          id: string
          question_text: string
          question_text_tts: string | null
          scenario_id: string
          sort_order: number | null
          source_language: string | null
          target_language: string | null
          type: string
          word_id: string | null
        }
        Insert: {
          created_at?: string | null
          data?: Json | null
          hint?: string | null
          id?: string
          question_text: string
          question_text_tts?: string | null
          scenario_id: string
          sort_order?: number | null
          source_language?: string | null
          target_language?: string | null
          type: string
          word_id?: string | null
        }
        Update: {
          created_at?: string | null
          data?: Json | null
          hint?: string | null
          id?: string
          question_text?: string
          question_text_tts?: string | null
          scenario_id?: string
          sort_order?: number | null
          source_language?: string | null
          target_language?: string | null
          type?: string
          word_id?: string | null
        }
        Relationships: [
          {
            foreignKeyName: 'questions_scenario_id_fkey'
            columns: ['scenario_id']
            isOneToOne: false
            referencedRelation: 'scenarios'
            referencedColumns: ['id']
          },
          {
            foreignKeyName: 'questions_word_id_fkey'
            columns: ['word_id']
            isOneToOne: false
            referencedRelation: 'words'
            referencedColumns: ['id']
          },
        ]
      }
      scenario_translations: {
        Row: {
          description: string | null
          id: string
          language: string
          scenario_id: string
          title: string
        }
        Insert: {
          description?: string | null
          id?: string
          language: string
          scenario_id: string
          title: string
        }
        Update: {
          description?: string | null
          id?: string
          language?: string
          scenario_id?: string
          title?: string
        }
        Relationships: [
          {
            foreignKeyName: 'scenario_translations_scenario_id_fkey'
            columns: ['scenario_id']
            isOneToOne: false
            referencedRelation: 'scenarios'
            referencedColumns: ['id']
          },
        ]
      }
      scenarios: {
        Row: {
          category: string
          emoji: string | null
          id: string
          level: string
          sort_order: number | null
        }
        Insert: {
          category: string
          emoji?: string | null
          id?: string
          level: string
          sort_order?: number | null
        }
        Update: {
          category?: string
          emoji?: string | null
          id?: string
          level?: string
          sort_order?: number | null
        }
        Relationships: []
      }
      word_translations: {
        Row: {
          audio_text: string | null
          id: string
          language: string
          text: string
          word_id: string
        }
        Insert: {
          audio_text?: string | null
          id?: string
          language: string
          text: string
          word_id: string
        }
        Update: {
          audio_text?: string | null
          id?: string
          language?: string
          text?: string
          word_id?: string
        }
        Relationships: [
          {
            foreignKeyName: 'word_translations_word_id_fkey'
            columns: ['word_id']
            isOneToOne: false
            referencedRelation: 'words'
            referencedColumns: ['id']
          },
        ]
      }
      words: {
        Row: {
          base_key: string
          category: string
          emoji: string | null
          id: string
          level: string
        }
        Insert: {
          base_key: string
          category: string
          emoji?: string | null
          id?: string
          level: string
        }
        Update: {
          base_key?: string
          category?: string
          emoji?: string | null
          id?: string
          level?: string
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, '__InternalSupabase'>

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, 'public'>]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema['Tables'] & DefaultSchema['Views'])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions['schema']]['Tables'] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions['schema']]['Views'])
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions['schema']]['Tables'] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions['schema']]['Views'])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema['Tables'] & DefaultSchema['Views'])
    ? (DefaultSchema['Tables'] & DefaultSchema['Views'])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    keyof DefaultSchema['Tables'] | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions['schema']]['Tables']
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions['schema']]['Tables'][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema['Tables']
    ? DefaultSchema['Tables'][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    keyof DefaultSchema['Tables'] | { schema: keyof DatabaseWithoutInternals },
  TableName extends (DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions['schema']]['Tables']
    : never) = never,
> = DefaultSchemaTableNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions['schema']]['Tables'][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema['Tables']
    ? DefaultSchema['Tables'][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    keyof DefaultSchema['Enums'] | { schema: keyof DatabaseWithoutInternals },
  EnumName extends (DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions['schema']]['Enums']
    : never) = never,
> = DefaultSchemaEnumNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions['schema']]['Enums'][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema['Enums']
    ? DefaultSchema['Enums'][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    keyof DefaultSchema['CompositeTypes'] | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends (PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions['schema']]['CompositeTypes']
    : never) = never,
> = PublicCompositeTypeNameOrOptions extends { schema: keyof DatabaseWithoutInternals }
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions['schema']]['CompositeTypes'][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema['CompositeTypes']
    ? DefaultSchema['CompositeTypes'][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {},
  },
} as const
