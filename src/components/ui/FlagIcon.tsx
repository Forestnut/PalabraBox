import React from 'react';
import { cn } from '../../utils/cn';

type FlagProps = {
  countryCode: string;
  className?: string;
};

export const FlagIcon: React.FC<FlagProps> = ({ countryCode, className }) => {
  return (
    <img
      src={`https://flagcdn.com/${countryCode.toLowerCase()}.svg`}
      alt={`Bandera de ${countryCode}`}
      className={cn("inline-block w-10 min-w-10 aspect-4/3 rounded-sm object-cover shadow-sm shrink-0", className)}
    />
  );
};