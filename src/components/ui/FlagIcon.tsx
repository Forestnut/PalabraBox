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
      className={cn("inline-block w-8 h-8 rounded-sm object-cover shadow-sm", className)}
      loading="lazy"
    />
  );
};
