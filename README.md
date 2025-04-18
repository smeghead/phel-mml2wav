# phel-mml2wav

A command-line tool written in Phel that converts MML (Music Macro Language) to WAV format.

## What is MML?

Music Macro Language (MML) is a music description language used in many applications and games for creating music. It allows you to describe musical sequences using simple text notation.

## Installation

### Prerequisites

- PHP 8.4 or later
- [Composer](https://getcomposer.org/)

### Setup

1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/phel-mml2wav.git
   cd phel-mml2wav
   ```

2. Install dependencies
   ```bash
   composer install
   ```

## Usage

The tool reads MML from standard input and outputs WAV data to standard output.

### Basic usage

```bash
echo 'T120 CDERCDERGEDCDED' | vendor/bin/phel -q run src/main.phel > output.wav
```

### Play directly with audio player

You can pipe the output directly to an audio player:

```bash
# Linux (with ALSA)
echo 'T120 CDERCDERGEDCDED' | vendor/bin/phel -q run src/main.phel | aplay

# macOS
echo 'T120 CDERCDERGEDCDED' | vendor/bin/phel -q run src/main.phel | afplay

# Windows (requires sox)
echo 'T120 CDERCDERGEDCDED' | vendor/bin/phel -q run src/main.phel | play -t wav -
```

## Supported MML Commands

- Notes: `A` through `G`, `R` (rest)
- Octave: `O<number>` (e.g., `O4`)
- Octave shift: `>` (up), `<` (down)
- Note length: `L<number>` (e.g., `L4` for quarter note)
- Tempo: `T<number>` (e.g., `T120` for 120 BPM)

## About This Project

This is an experimental project created for learning purposes. It demonstrates how to implement audio processing in Phel language, including:

- MML parsing
- Waveform generation
- PCM conversion
- WAV file format creation

## FAQ

### Q: I'm getting memory allocation errors when processing longer MML sequences

A: This can happen because generating audio data can be memory-intensive. Try increasing the PHP memory limit by:

- Setting it in your php.ini file: `memory_limit = 256M` or higher
- Or, running the script with the memory limit flag:
  ```bash
  php -d memory_limit=256M vendor/bin/phel -q run src/main.phel
  ```

### Q: Why use Phel for audio processing?

A: While not optimized for audio processing, this project demonstrates Phel's versatility and serves as an educational tool for understanding both functional programming concepts and basic audio synthesis principles.

## Examples

### Simple scale
```
O4 CDEFGAB>C
```

### Twinkle Twinkle Little Star
```
T120 CCGGAAG FFEEDDC GGFFEED GGFFEED CCGGAAG FFEEDDC
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
