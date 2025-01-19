<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PortfolioResource\Pages;
use App\Models\Portfolio;
use App\Models\Like;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class PortfolioResource extends Resource
{
    protected static ?string $model = Portfolio::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    // **Formulier** voor het aanmaken en bewerken van portfolio's
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('title')
                    ->label('Title')
                    ->required()
                    ->maxLength(255),

                Forms\Components\Textarea::make('description')
                    ->label('Description')
                    ->required()
                    ->maxLength(500),

                Forms\Components\TextInput::make('link')
                    ->label('Project Link')
                    ->url()
                    ->nullable()
                    ->maxLength(255),

                Forms\Components\FileUpload::make('image')
                    ->label('Image')
                    ->image()
                    ->required()
                    ->maxSize(1024), // 1MB limit

                // Voeg hier extra velden toe zoals tags, categorieën, etc.
            ]);
    }

    // **Tabel** voor het weergeven van portfolio's in de admin
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('title')
                    ->label('Title')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('description')
                    ->label('Description')
                    ->limit(50)
                    ->searchable(),

                Tables\Columns\TextColumn::make('user.name')
                    ->label('Created By')
                    ->sortable()
                    ->searchable(),

                Tables\Columns\ImageColumn::make('image')
                    ->label('Image')
                    ->square()
                    ->size(50), // Afbeelding weergave

                Tables\Columns\TextColumn::make('likes_count')
                    ->label('Likes')
                    ->formatStateUsing(fn($record) => $record->likes->count()) // Aantal likes
                    ->sortable(),

                Tables\Columns\TextColumn::make('created_at')
                    ->label('Created At')
                    ->dateTime()
                    ->sortable(),
            ])
            ->filters([
                // Voeg filters toe, bijvoorbeeld op basis van datum of likes
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    // **Relaties**: Hier definieer je relaties met andere modellen
    public static function getRelations(): array
    {
        return [
            // Als je de likes wilt beheren in het admin-paneel, kun je hier de relatie naar likes toevoegen
            // Bijvoorbeeld, als je een 'like' relatie hebt in je Portfolio-model:
            // Filament ondersteunt automatisch de beheerpagina's voor relaties zoals 'likes' als die goed gedefinieerd zijn in je modellen.
        ];
    }

    // **Pagina's**: Deze routes verwijzen naar de pagina's voor lijstweergave, maken en bewerken van portfolio's
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPortfolios::route('/'),
            'create' => Pages\CreatePortfolio::route('/create'),
            'edit' => Pages\EditPortfolio::route('/{record}/edit'),
        ];
    }
}
